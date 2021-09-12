import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app_airplane/model/transaction_model.dart';
import 'package:flutter_app_airplane/services/transaction_service.dart';
import 'package:flutter_app_airplane/services/user_service.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  void createTransaction(TransactionModel transactionModel)async{
    try {
      emit(TransactionLoading());
      await TransactionService().createTransaction(transactionModel);
      emit(TransactionSuccess([]));
    } catch (e) {
      emit(TransactionFailed(e.toString()));
    }
  }

  void createTransactionUpdate(TransactionModel transactionModel, String id, int balance)async{
    try {
      emit(TransactionLoading());
      await TransactionService().createTransaction(transactionModel);
      await UserService().updateBalance(id, balance);
      emit(TransactionSuccess([]));
    } catch (e) {
      emit(TransactionFailed(e.toString()));
    }
  }

  void fetchTransaction() async{
    try {
      emit(TransactionLoading());
      List<TransactionModel> transactions = await TransactionService().fetchTransaction();
      emit(TransactionSuccess(transactions));
    } catch (e) {
      emit(TransactionFailed(e.toString()));
    }
  }
}
