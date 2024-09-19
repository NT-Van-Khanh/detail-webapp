package com.pthttm.retail.service;

import com.google.cloud.storage.Blob;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;
import com.google.firebase.cloud.StorageClient;

import com.pthttm.retail.repository.firebase.FirebaseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;

@Service
public class FirebaseService {
    private final FirebaseRepository firebaseRepository;

    @Autowired
    public FirebaseService(FirebaseRepository firebaseRepository) {
        this.firebaseRepository = firebaseRepository;
    }
    public InputStream getObject(String bucketName, String fileName) throws IOException {
        return firebaseRepository.getObject(bucketName, fileName);
    }

    public void uploadObject(String bucketName, String fileName, InputStream inputStream) throws IOException {
        firebaseRepository.uploadObject(bucketName, fileName, inputStream);
    }

    public void deleteObject(String bucketName, String fileName) throws IOException {
        firebaseRepository.deleteObject(bucketName, fileName);
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
