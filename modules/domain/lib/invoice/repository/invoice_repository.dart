import 'package:domain/domain.dart';

abstract class InvoiceRepository {
  Future<List<Invoice>> getPedingInvoices(String id);
  Future<List<Invoice>> getInvoiceHistory(String id);
  Future<Invoice> finishInvoice(String id, bool approve);
}
