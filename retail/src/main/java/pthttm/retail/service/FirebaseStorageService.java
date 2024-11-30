package pthttm.retail.service;

import pthttm.retail.repository.firebase.FirebaseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.InputStream;

@Service
public class FirebaseStorageService {
    private final FirebaseRepository firebaseRepository;

    @Autowired
    public FirebaseStorageService(FirebaseRepository firebaseRepository) {
        this.firebaseRepository = firebaseRepository;
    }

    public String getObjectUrl(String filename) throws IOException{
        return firebaseRepository.getObjectUrl(filename);
    }

    public InputStream getObject(String fileName) throws IOException {
        return firebaseRepository.getObject(fileName);
    }

    public void uploadObject(String fileName, InputStream inputStream,String contentType) throws IOException {
        firebaseRepository.uploadObject( fileName, inputStream,contentType);//contentType là type của file được lưu trong fb
    }

    public void deleteObject(String fileName) throws IOException {
        firebaseRepository.deleteObject(fileName);
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
