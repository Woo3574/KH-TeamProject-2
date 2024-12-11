import firebase from "firebase/compat/app";
import "firebase/compat/storage";

const FirebaseConfig = {
  apiKey: "AIzaSyAiqhHFZZ6I9pVBKJDq9CsKaHkRyINI6EI",
  authDomain: "project-mini-db956.firebaseapp.com",
  projectId: "project-mini-db956",
  storageBucket: "project-mini-db956.firebasestorage.app",
  messagingSenderId: "133573505966",
  appId: "1:133573505966:web:e7de7b32f69c620dde8e3f",
  measurementId: "G-26JVZ5JWDH",
};
// Initialize Firebase
firebase.initializeApp(FirebaseConfig);
export const storage = firebase.storage();
