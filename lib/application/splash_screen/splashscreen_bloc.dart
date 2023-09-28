// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:async';

import 'package:ambulance_module/domain/failures/failures.dart';
import 'package:ambulance_module/domain/routes/routes.dart';
import 'package:ambulance_module/presentation/components/modals/driver_login_modal.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../infrastructure/global_database/apis/check_database_connectivity_repo/i_repo.dart';
import '../../infrastructure/local_database/secured_shared_preference/secured_shared_preference.dart';

part 'splashscreen_event.dart';
part 'splashscreen_state.dart';
part 'splashscreen_bloc.freezed.dart';

@injectable
class SplashscreenBloc extends Bloc<SplashscreenEvent, SplashscreenState> {
  SplashscreenBloc() : super(const _Initial()) {
    on<Started>((event, emit) async {
      // Future.delayed(Duration(seconds: 3));
      ICheckDatabaseConnectivityRepo checkConnectionRepo =
          ICheckDatabaseConnectivityRepo();
      var connectionstatus = await checkConnectionRepo.checkConnection();

      FlutterLocalSecuredStorage _securedStorageinstance =
          FlutterLocalSecuredStorage();

      connectionstatus.fold(
          (l) => showDialog(
              context: event.ctx,
              builder: (context) => Dialog(
                    child: Container(
                      height: 200,
                      width: 200,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset("assets/images/server error.jpg"),
                          GestureDetector(
                              onTap: () => Navigator.of(event.ctx)
                                  .pushReplacementNamed(RoutPaths.splashScreen),
                              child: Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(top: 20),
                                width: 60,
                                height: 25,
                                color: Colors.amber,
                                child:const Text("Refresh"),
                              ))
                        ],
                      ),
                    ),
                  )), (r) async {
        if (await _securedStorageinstance.getbool("AUTH_TOKEN")) {
          Timer(
              const Duration(seconds: 3),
              () =>
                  Navigator.pushNamed(event.ctx, RoutPaths.driverLoginScreen));
          //  BlocProvider.of<SplashscreenBloc>(event.ctx).close();
        } else {
          Timer(
              const Duration(seconds: 1),
              () => showDialog(
                  context: event.ctx,
                  builder: (context) => const DriverLoginModal(
                        isPassword: true,
                      ),
                  barrierDismissible: false));
        }
      });
    });
  }
}
