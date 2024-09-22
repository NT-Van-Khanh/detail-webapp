package com.pthttm.retail.service;

import com.pthttm.retail.repository.firebase.FirebaseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.InputStream;

@Service
public class FirebaseService {
    private final FirebaseRepository firebaseRepository;
    private final String bucketFirebase ="retailstorage-5432c.appspot.com";
    @Autowired
    public FirebaseService(FirebaseRepository firebaseRepository) {
        this.firebaseRepository = firebaseRepository;
    }
    public InputStream getObject(String fileName) throws IOException {
        return firebaseRepository.getObject(bucketFirebase, fileName);
    }

    public void uploadObject(String fileName, InputStream inputStream) throws IOException {
        firebaseRepository.uploadObject(bucketFirebase, fileName, inputStream);
    }

    public void deleteObject(String fileName) throws IOException {
        firebaseRepository.deleteObject(bucketFirebase, fileName);
    }
    /*    private final StorageClient storageClient = StorageClient.getInstance();
    public InputStream getObject(String bucketName, String fileName) throws IOException {
        Blob blob = storageClient.bucket(bucketName).get(fileName);
        if (blob != null) {
            return new ByteArrayInputStream(blob.getContent());
        }else {
            throw new IOException("File " + fileName + " not found in bucket " + bucketName);
        }
    }*/

    /*
        private final Storage storage = StorageOptions.getDefaultInstance().getService();
        public InputStream getObject(String bucketName, String fileName) throws IOException {
            Blob blob = storage.get(bucketName, fileName);
            if (blob != null) {
                return new ByteArrayInputStream(blob.getContent());
            }else {
                throw new IOException("File " + fileName + " not found in bucket " + bucketName);
            }
        }*/

}
