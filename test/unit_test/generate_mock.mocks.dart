// Mocks generated by Mockito 5.4.4 from annotations
// in weather_app/test/unit_test/generate_mock.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;

import 'package:clock/clock.dart' as _i6;
import 'package:dio/dio.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:weather_app/core/utils/data_state.dart' as _i4;
import 'package:weather_app/features/weather/data/models/weather_model.dart'
    as _i3;
import 'package:weather_app/features/weather/data/sources/remote/weather_api_service.dart'
    as _i7;
import 'package:weather_app/features/weather/domain/entities/weather.dart'
    as _i9;
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart'
    as _i5;
import 'package:weather_app/features/weather/domain/usecases/calculate_daylight.dart'
    as _i11;
import 'package:weather_app/features/weather/domain/usecases/get_weather.dart'
    as _i10;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDio_0 extends _i1.SmartFake implements _i2.Dio {
  _FakeDio_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeWeatherModel_1 extends _i1.SmartFake implements _i3.WeatherModel {
  _FakeWeatherModel_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDataState_2<T> extends _i1.SmartFake implements _i4.DataState<T> {
  _FakeDataState_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeWeatherRepository_3 extends _i1.SmartFake
    implements _i5.WeatherRepository {
  _FakeWeatherRepository_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeClock_4 extends _i1.SmartFake implements _i6.Clock {
  _FakeClock_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDuration_5 extends _i1.SmartFake implements Duration {
  _FakeDuration_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [WeatherApiService].
///
/// See the documentation for Mockito's code generation for more information.
class MockWeatherApiService extends _i1.Mock implements _i7.WeatherApiService {
  MockWeatherApiService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Dio get dio => (super.noSuchMethod(
        Invocation.getter(#dio),
        returnValue: _FakeDio_0(
          this,
          Invocation.getter(#dio),
        ),
      ) as _i2.Dio);

  @override
  _i8.Future<_i3.WeatherModel> fetchWeather(String? city) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchWeather,
          [city],
        ),
        returnValue: _i8.Future<_i3.WeatherModel>.value(_FakeWeatherModel_1(
          this,
          Invocation.method(
            #fetchWeather,
            [city],
          ),
        )),
      ) as _i8.Future<_i3.WeatherModel>);
}

/// A class which mocks [WeatherRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockWeatherRepository extends _i1.Mock implements _i5.WeatherRepository {
  MockWeatherRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i4.DataState<_i9.Weather>> getWeather(String? city) =>
      (super.noSuchMethod(
        Invocation.method(
          #getWeather,
          [city],
        ),
        returnValue: _i8.Future<_i4.DataState<_i9.Weather>>.value(
            _FakeDataState_2<_i9.Weather>(
          this,
          Invocation.method(
            #getWeather,
            [city],
          ),
        )),
      ) as _i8.Future<_i4.DataState<_i9.Weather>>);
}

/// A class which mocks [GetWeather].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetWeather extends _i1.Mock implements _i10.GetWeather {
  MockGetWeather() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.WeatherRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeWeatherRepository_3(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i5.WeatherRepository);

  @override
  _i8.Future<_i4.DataState<_i9.Weather>> call(String? city) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [city],
        ),
        returnValue: _i8.Future<_i4.DataState<_i9.Weather>>.value(
            _FakeDataState_2<_i9.Weather>(
          this,
          Invocation.method(
            #call,
            [city],
          ),
        )),
      ) as _i8.Future<_i4.DataState<_i9.Weather>>);
}

/// A class which mocks [CalculateDaylightUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockCalculateDaylightUseCase extends _i1.Mock
    implements _i11.CalculateDaylightUseCase {
  MockCalculateDaylightUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Clock get clock => (super.noSuchMethod(
        Invocation.getter(#clock),
        returnValue: _FakeClock_4(
          this,
          Invocation.getter(#clock),
        ),
      ) as _i6.Clock);

  @override
  Duration calculateDayLength(
    String? sunriseTime,
    String? sunsetTime,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #calculateDayLength,
          [
            sunriseTime,
            sunsetTime,
          ],
        ),
        returnValue: _FakeDuration_5(
          this,
          Invocation.method(
            #calculateDayLength,
            [
              sunriseTime,
              sunsetTime,
            ],
          ),
        ),
      ) as Duration);

  @override
  Duration calculateRemainingDaylight(
    String? sunriseTime,
    String? sunsetTime,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #calculateRemainingDaylight,
          [
            sunriseTime,
            sunsetTime,
          ],
        ),
        returnValue: _FakeDuration_5(
          this,
          Invocation.method(
            #calculateRemainingDaylight,
            [
              sunriseTime,
              sunsetTime,
            ],
          ),
        ),
      ) as Duration);
}
