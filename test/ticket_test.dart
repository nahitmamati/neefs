import 'package:flutter_test/flutter_test.dart';
import 'package:neefs/features/tickets/data/datasources/tickets_remote_datasource.dart';

void main() {
  test("Get Tickets", () async {
    var source = TicketRemoteDataSourceImpl();

    try {
      var response = await source.getTickets(
          token: "990|wRJTgU9Ghu9q7wuRzhvHOjuGXkvAfIwBGJzBBDmv");

      for (var model in response) {
        print(model.title);
      }
    } catch (e) {
      print(e);
    }
  });
  test("Add Ticket", () async {
    var source = TicketRemoteDataSourceImpl();

    try {
      var response = await source.addTicket(
        token: "990|wRJTgU9Ghu9q7wuRzhvHOjuGXkvAfIwBGJzBBDmv",
        title: "Mahkemenin odası kokuyor",
        message:
            "Bak kardeşim ben 20 yıldır bu mahkemede hakem olarak çalışıyorum, bir kere bile böyle bir kokuyla karşılaşmamıştım. Düzeltin şunu yoksa istifamı basarım.",
        topic: "Mahkeme kokusu",
      );
      print(response.toString());
    } catch (e) {
      print(e);
    }
  });
  test("Respond Ticket", () async {
    var source = TicketRemoteDataSourceImpl();

    try {
      var response = await source.respondTicket(
        token: "990|wRJTgU9Ghu9q7wuRzhvHOjuGXkvAfIwBGJzBBDmv",
        id: "95",
        message: "Düzelttik kardeşim",
      );
      print(response.toString());
    } catch (e) {
      print(e);
    }
  });
}
