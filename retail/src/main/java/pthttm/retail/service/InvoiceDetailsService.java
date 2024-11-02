package pthttm.retail.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pthttm.retail.model.InvoiceDetails;
import pthttm.retail.repository.InvoiceDetailsRepository;
@Service
public class InvoiceDetailsService {

    @Autowired
    private InvoiceDetailsRepository invoiceDetailsRepository;

    public void saveInvoiceDetail(InvoiceDetails detail) {
        invoiceDetailsRepository.save(detail);
    }
}