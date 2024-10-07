package pthttm.retail.repository.firebase;

import com.google.cloud.storage.Blob;
import com.google.firebase.cloud.StorageClient;
import org.springframework.stereotype.Repository;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;

@Repository
public class FirebaseRepositoryImpl implements FirebaseRepository {

    private final StorageClient storageClient = StorageClient.getInstance();

    @Override
    public InputStream getObject(String bucketName, String fileName) throws IOException {
        Blob blob = storageClient.bucket(bucketName).get(fileName);
        if (blob != null) {
            return new ByteArrayInputStream(blob.getContent());
        }else {
            throw new IOException("File " + fileName + " not found in bucket " + bucketName);
        }
    }

    @Override
    public void uploadObject(String bucketName, String fileName, InputStream inputStream) throws IOException {
        Blob blob = storageClient.bucket(bucketName).create(fileName, inputStream, "application/octet-stream");
        if (blob == null) {
            throw new IOException("Failed to upload file " + fileName + " to bucket " + bucketName);
        }
    }

    @Override
    public void deleteObject(String bucketName, String fileName) throws IOException {
        Blob blob = storageClient.bucket(bucketName).get(fileName);
        if (blob != null) {
            blob.delete();
        } else {
            throw new IOException("File " + fileName + " not found in bucket " + bucketName);
        }
    }
}
