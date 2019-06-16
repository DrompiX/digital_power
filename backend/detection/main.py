import cv2
import numpy as np
from scipy.spatial.distance import cosine
import tensorflow as tf
from tensorflow.python.platform import gfile

from image_utils import preprocess_image, crop_face_box
from mtcnn.mtcnn import MTCNN

import os
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'


def to_rgb(img):
    return cv2.cvtColor(img, cv2.COLOR_BGR2RGB)


def load_facenet_model(model, input_map=None):
    model_exp = os.path.expanduser(model)
    if (os.path.isfile(model_exp)):
        print('Model filename: %s' % model_exp)
        with gfile.FastGFile(model_exp, 'rb') as f:
            graph_def = tf.GraphDef()
            graph_def.ParseFromString(f.read())
            tf.import_graph_def(graph_def, input_map=input_map, name='')


class Facenet:
    def __init__(self):
        self.facenet_path = '../detection/model.pb'
        print(os.getcwd())
        self.image_size = 160
        self.graph = tf.Graph()
        with self.graph.as_default():
            with tf.Session(graph=self.graph) as sess:
                load_facenet_model(self.facenet_path)
                print([n.name for n in tf.get_default_graph().as_graph_def().node])
                self.images_placeholder = tf.get_default_graph().get_tensor_by_name("input:0")
                self.embeddings = tf.get_default_graph().get_tensor_by_name("embeddings:0")
                self.phase_train_placeholder = tf.get_default_graph().get_tensor_by_name("phase_train:0")
                self.embedding_size = self.embeddings.get_shape()[1]

    def get_embedding(self, img):
        with self.graph.as_default():
            with tf.Session(graph=self.graph) as sess:
                emb_array = np.zeros((1, self.embedding_size))
                feed_dict = {self.images_placeholder: img, self.phase_train_placeholder: False}
                emb_array[0, :] = sess.run(self.embeddings, feed_dict=feed_dict)
        return emb_array

    def recognize_face(self, img, conf=0.6):
        with self.graph.as_default():
            with tf.Session(graph=self.graph) as sess:
                # Get facenet embeddings
                emb_array = np.zeros((1, self.embedding_size))
                image = np.array([preprocess_image(img, False, False, 160)])
                feed_dict = {self.images_placeholder: image, self.phase_train_placeholder: False}
                emb_array[0, :] = sess.run(self.embeddings, feed_dict=feed_dict)
                print(emb_array)


def detect(img):
    cascPath = "haarcascade_frontalface_default.xml"

    # Create the haar cascade
    faceCascade = cv2.CascadeClassifier(cascPath)

    # Read the image
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

    # Detect faces in the image
    faces = faceCascade.detectMultiScale(
        gray,
        scaleFactor=1.1,
        minNeighbors=5,
        minSize=(30, 30),
        flags=cv2.CASCADE_SCALE_IMAGE
    )

    return faces[0]


def get_emb(network, path):
    detector = MTCNN()
    image = cv2.imread(path)
    detection = detector.detect_faces(image)
    faces = [crop_face_box(image, tuple(detected['box'])) for detected in detection]
    return [network.get_embedding(face) for face in faces]


network = Facenet()


def compute_cosine_distance(path: str):
    emb = get_emb(network, path)
    return cosine(emb[0], emb[1])
