package pthttm.retail.repository.firebase;

import com.google.cloud.storage.Blob;
import com.google.firebase.cloud.StorageClient;
import org.springframework.stereotype.Repository;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@Repository
public class FirebaseRepositoryImpl implements FirebaseRepository {

    private final StorageClient storageClient = StorageClient.getInstance();

    @Override
    public String getObjectUrl(String bucketName, String fileName) throws IOException{
        Blob blob = storageClient.bucket(bucketName).get(fileName);
        if (blob != null&& blob.exists()) {
            /*String encodedFileName = URLEncoder.encode(fileName, StandardCharsets.UTF_8.toString());*/
            return String.format("https://firebasestorage.googleapis.com/v0/b/%s/o/%s?alt=media", bucketName, fileName);
        }else {
            return null;
            /*throw new IOException("File " + fileName + " not found in bucket " + bucketName);*/
        }
    };

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
    public void uploadObject(String bucketName, String fileName, InputStream inputStream,String contentType) throws IOException {
        Blob blob = storageClient.bucket(bucketName).create(fileName, inputStream, contentType);
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
