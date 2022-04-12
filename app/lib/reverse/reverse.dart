class RouteValue {
  String name;
  Function(Map? params) url;
  int numParams;

  RouteValue({required this.name, required this.url, required this.numParams});
}

class InvalidReverseParamsException implements  Exception {
    InvalidReverseParamsException();
  }

String? reverse(String name, [Map? params]) {
    List data = <RouteValue>[
    
    RouteValue(
    name:'admin:index',
    url:(Map? params)=>  '',
    numParams:0),
    
    RouteValue(
    name:'admin:login',
    url:(Map? params)=>  'login/',
    numParams:0),
    
    RouteValue(
    name:'admin:logout',
    url:(Map? params)=>  'logout/',
    numParams:0),
    
    RouteValue(
    name:'admin:password_change',
    url:(Map? params)=>  'password_change/',
    numParams:0),
    
    RouteValue(
    name:'admin:password_change_done',
    url:(Map? params)=>  'password_change/done/',
    numParams:0),
    
    RouteValue(
    name:'admin:autocomplete',
    url:(Map? params)=>  'autocomplete/',
    numParams:0),
    
    RouteValue(
    name:'admin:jsi18n',
    url:(Map? params)=>  'jsi18n/',
    numParams:0),
    
    RouteValue(
    name:'admin:view_on_site',
    url:(Map? params)=> (params?['content_type_id'] != null) &&(params?['object_id'] != null) && true ? 'r/${params?["content_type_id"]}/${params?["object_id"]}/': throw InvalidReverseParamsException(),
    numParams:2),
    
    RouteValue(
    name:'admin:sites_site_changelist',
    url:(Map? params)=>  '',
    numParams:0),
    
    RouteValue(
    name:'admin:sites_site_add',
    url:(Map? params)=>  'add/',
    numParams:0),
    
    RouteValue(
    name:'admin:sites_site_history',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/history/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin:sites_site_delete',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/delete/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin:sites_site_change',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/change/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin:auth_group_changelist',
    url:(Map? params)=>  '',
    numParams:0),
    
    RouteValue(
    name:'admin:auth_group_add',
    url:(Map? params)=>  'add/',
    numParams:0),
    
    RouteValue(
    name:'admin:auth_group_history',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/history/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin:auth_group_delete',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/delete/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin:auth_group_change',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/change/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin:auth_user_password_change',
    url:(Map? params)=>  '<id>/password/',
    numParams:0),
    
    RouteValue(
    name:'admin:auth_user_changelist',
    url:(Map? params)=>  '',
    numParams:0),
    
    RouteValue(
    name:'admin:auth_user_add',
    url:(Map? params)=>  'add/',
    numParams:0),
    
    RouteValue(
    name:'admin:auth_user_history',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/history/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin:auth_user_delete',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/delete/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin:auth_user_change',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/change/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin:authtoken_tokenproxy_changelist',
    url:(Map? params)=>  '',
    numParams:0),
    
    RouteValue(
    name:'admin:authtoken_tokenproxy_add',
    url:(Map? params)=>  'add/',
    numParams:0),
    
    RouteValue(
    name:'admin:authtoken_tokenproxy_history',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/history/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin:authtoken_tokenproxy_delete',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/delete/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin:authtoken_tokenproxy_change',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/change/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin:core_person_changelist',
    url:(Map? params)=>  '',
    numParams:0),
    
    RouteValue(
    name:'admin:core_person_add',
    url:(Map? params)=>  'add/',
    numParams:0),
    
    RouteValue(
    name:'admin:core_person_history',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/history/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin:core_person_delete',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/delete/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin:core_person_change',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/change/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin:core_typedefaultavatar_changelist',
    url:(Map? params)=>  '',
    numParams:0),
    
    RouteValue(
    name:'admin:core_typedefaultavatar_add',
    url:(Map? params)=>  'add/',
    numParams:0),
    
    RouteValue(
    name:'admin:core_typedefaultavatar_history',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/history/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin:core_typedefaultavatar_delete',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/delete/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin:core_typedefaultavatar_change',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/change/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin:workout_trainingplan_changelist',
    url:(Map? params)=>  '',
    numParams:0),
    
    RouteValue(
    name:'admin:workout_trainingplan_add',
    url:(Map? params)=>  'add/',
    numParams:0),
    
    RouteValue(
    name:'admin:workout_trainingplan_history',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/history/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin:workout_trainingplan_delete',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/delete/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin:workout_trainingplan_change',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/change/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin:workout_training_changelist',
    url:(Map? params)=>  '',
    numParams:0),
    
    RouteValue(
    name:'admin:workout_training_add',
    url:(Map? params)=>  'add/',
    numParams:0),
    
    RouteValue(
    name:'admin:workout_training_history',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/history/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin:workout_training_delete',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/delete/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin:workout_training_change',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/change/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin:workout_exercise_changelist',
    url:(Map? params)=>  '',
    numParams:0),
    
    RouteValue(
    name:'admin:workout_exercise_add',
    url:(Map? params)=>  'add/',
    numParams:0),
    
    RouteValue(
    name:'admin:workout_exercise_history',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/history/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin:workout_exercise_delete',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/delete/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin:workout_exercise_change',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/change/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin:workout_overload_changelist',
    url:(Map? params)=>  '',
    numParams:0),
    
    RouteValue(
    name:'admin:workout_overload_add',
    url:(Map? params)=>  'add/',
    numParams:0),
    
    RouteValue(
    name:'admin:workout_overload_history',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/history/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin:workout_overload_delete',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/delete/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin:workout_overload_change',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/change/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin:workout_trainingactive_changelist',
    url:(Map? params)=>  '',
    numParams:0),
    
    RouteValue(
    name:'admin:workout_trainingactive_add',
    url:(Map? params)=>  'add/',
    numParams:0),
    
    RouteValue(
    name:'admin:workout_trainingactive_history',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/history/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin:workout_trainingactive_delete',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/delete/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin:workout_trainingactive_change',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/change/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin:workout_typeoverload_changelist',
    url:(Map? params)=>  '',
    numParams:0),
    
    RouteValue(
    name:'admin:workout_typeoverload_add',
    url:(Map? params)=>  'add/',
    numParams:0),
    
    RouteValue(
    name:'admin:workout_typeoverload_history',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/history/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin:workout_typeoverload_delete',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/delete/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin:workout_typeoverload_change',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/change/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin:workout_typetrainingstate_changelist',
    url:(Map? params)=>  '',
    numParams:0),
    
    RouteValue(
    name:'admin:workout_typetrainingstate_add',
    url:(Map? params)=>  'add/',
    numParams:0),
    
    RouteValue(
    name:'admin:workout_typetrainingstate_history',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/history/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin:workout_typetrainingstate_delete',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/delete/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin:workout_typetrainingstate_change',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/change/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin',
    url:(Map? params)=> (params?['object_id'] != null) && true ? '${params?["object_id"]}/': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'admin:app_list',
    url:(Map? params)=>  '^(?P<app_label>sites|auth|authtoken|core|workout)/\$',
    numParams:0),
    
    RouteValue(
    name:'admin',
    url:(Map? params)=>  '(?P<url>.*)\$',
    numParams:0),
    
    RouteValue(
    name:'schema-swagger-ui',
    url:(Map? params)=>  '',
    numParams:0),
    
    RouteValue(
    name:'schema-json',
    url:(Map? params)=>  'swagger/<format>/',
    numParams:0),
    
    RouteValue(
    name:'schema-swagger-ui',
    url:(Map? params)=>  'swagger/',
    numParams:0),
    
    RouteValue(
    name:'schema-redoc',
    url:(Map? params)=>  'redoc/',
    numParams:0),
    
    RouteValue(
    name:'core:profile_picture',
    url:(Map? params)=>  'profile/picture',
    numParams:0),
    
    RouteValue(
    name:'core:default_avatars',
    url:(Map? params)=>  'defaults/avatars',
    numParams:0),
    
    RouteValue(
    name:'workout:training_plan',
    url:(Map? params)=>  'plan',
    numParams:0),
    
    RouteValue(
    name:'workout:training_plan',
    url:(Map? params)=> (params?['training_plan_id'] != null) && true ? 'plan/${params?["training_plan_id"]}': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'workout:training',
    url:(Map? params)=> (params?['training_plan_id'] != null) && true ? 'training/${params?["training_plan_id"]}': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'workout:training',
    url:(Map? params)=> (params?['training_plan_id'] != null) &&(params?['training_id'] != null) && true ? 'training/${params?["training_plan_id"]}/${params?["training_id"]}': throw InvalidReverseParamsException(),
    numParams:2),
    
    RouteValue(
    name:'workout:training_active',
    url:(Map? params)=> (params?['training_id'] != null) && true ? 'training-active/${params?["training_id"]}': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'workout:training_active_set_one_overload',
    url:(Map? params)=> (params?['training_active_id'] != null) && true ? 'training-active/${params?["training_active_id"]}/set-overload/one': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'workout:training_active_set_multiple_overloads',
    url:(Map? params)=> (params?['training_active_id'] != null) && true ? 'training-active/${params?["training_active_id"]}/set-overload/multiple': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'workout:training_active_finish',
    url:(Map? params)=> (params?['training_active_id'] != null) && true ? 'training-active/${params?["training_active_id"]}/finish': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'workout:exercise',
    url:(Map? params)=> (params?['training_id'] != null) && true ? 'exercise/${params?["training_id"]}': throw InvalidReverseParamsException(),
    numParams:1),
    
    RouteValue(
    name:'workout:exercise',
    url:(Map? params)=> (params?['training_id'] != null) &&(params?['exercise_id'] != null) && true ? 'exercise/${params?["training_id"]}/${params?["exercise_id"]}': throw InvalidReverseParamsException(),
    numParams:2),
    
    RouteValue(
    name:'workout:exercise_order',
    url:(Map? params)=> (params?['training_id'] != null) &&(params?['exercise_id'] != null) && true ? 'exercise/${params?["training_id"]}/${params?["exercise_id"]}/order': throw InvalidReverseParamsException(),
    numParams:2),
    
    RouteValue(
    name:'my_auth:login',
    url:(Map? params)=>  'login',
    numParams:0),
    
    RouteValue(
    name:'my_auth:register',
    url:(Map? params)=>  'register',
    numParams:0),
    
    RouteValue(
    name:'my_auth:logout',
    url:(Map? params)=>  'logout',
    numParams:0),
    
    RouteValue(
    name:'',
    url:(Map? params)=>  '^media/(?P<path>.*)\$',
    numParams:0),
     ];
    for (RouteValue value in data) {
    if (value.name == name && value.numParams == (params?.length ?? 0)) {
    
    try {
    
      return value.url(params);
    
    }
    on InvalidReverseParamsException {
        
        print('Warning: Reverse parameters were named incorrectly.');
        print(params);
        
    }
    
    }
  }
  return null;
}




