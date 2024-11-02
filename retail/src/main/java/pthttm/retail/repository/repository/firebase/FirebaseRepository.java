package pthttm.retail.repository.repository.firebase;

import java.io.IOException;
import java.io.InputStream;

public interface FirebaseRepository {
    InputStream getObject(String bucketName, String fileName) throws IOException;
    void uploadObject(String bucketName, String fileName, InputStream inputStream) throws IOException;
    void deleteObject(String bucketName, String fileName) throws IOException;
}
