class InvalidReverseParamsException implements  Exception {
    InvalidReverseParamsException();
  }

String? reverse(String name, [Map? params]) {
    List data = [
    
    {
    'name':'admin:index',
    'url':(Map? params)=>  '',
    'num_params':0},
    
    {
    'name':'admin:login',
    'url':(Map? params)=>  'login/',
    'num_params':0},
    
    {
    'name':'admin:logout',
    'url':(Map? params)=>  'logout/',
    'num_params':0},
    
    {
    'name':'admin:password_change',
    'url':(Map? params)=>  'password_change/',
    'num_params':0},
    
    {
    'name':'admin:password_change_done',
    'url':(Map? params)=>  'password_change/done/',
    'num_params':0},
    
    {
    'name':'admin:autocomplete',
    'url':(Map? params)=>  'autocomplete/',
    'num_params':0},
    
    {
    'name':'admin:jsi18n',
    'url':(Map? params)=>  'jsi18n/',
    'num_params':0},
    
    {
    'name':'admin:view_on_site',
    'url':(Map? params)=> (params?["content_type_id"] != null) &&(params?["object_id"] != null) && true ? 'r/${params?["content_type_id"]}/${params?["object_id"]}/': throw new InvalidReverseParamsException(),
    'num_params':2},
    
    {
    'name':'admin:sites_site_changelist',
    'url':(Map? params)=>  '',
    'num_params':0},
    
    {
    'name':'admin:sites_site_add',
    'url':(Map? params)=>  'add/',
    'num_params':0},
    
    {
    'name':'admin:sites_site_history',
    'url':(Map? params)=> (params?["object_id"] != null) && true ? '${params?["object_id"]}/history/': throw new InvalidReverseParamsException(),
    'num_params':1},
    
    {
    'name':'admin:sites_site_delete',
    'url':(Map? params)=> (params?["object_id"] != null) && true ? '${params?["object_id"]}/delete/': throw new InvalidReverseParamsException(),
    'num_params':1},
    
    {
    'name':'admin:sites_site_change',
    'url':(Map? params)=> (params?["object_id"] != null) && true ? '${params?["object_id"]}/change/': throw new InvalidReverseParamsException(),
    'num_params':1},
    
    {
    'name':'admin',
    'url':(Map? params)=> (params?["object_id"] != null) && true ? '${params?["object_id"]}/': throw new InvalidReverseParamsException(),
    'num_params':1},
    
    {
    'name':'admin:auth_group_changelist',
    'url':(Map? params)=>  '',
    'num_params':0},
    
    {
    'name':'admin:auth_group_add',
    'url':(Map? params)=>  'add/',
    'num_params':0},
    
    {
    'name':'admin:auth_group_history',
    'url':(Map? params)=> (params?["object_id"] != null) && true ? '${params?["object_id"]}/history/': throw new InvalidReverseParamsException(),
    'num_params':1},
    
    {
    'name':'admin:auth_group_delete',
    'url':(Map? params)=> (params?["object_id"] != null) && true ? '${params?["object_id"]}/delete/': throw new InvalidReverseParamsException(),
    'num_params':1},
    
    {
    'name':'admin:auth_group_change',
    'url':(Map? params)=> (params?["object_id"] != null) && true ? '${params?["object_id"]}/change/': throw new InvalidReverseParamsException(),
    'num_params':1},
    
    {
    'name':'admin',
    'url':(Map? params)=> (params?["object_id"] != null) && true ? '${params?["object_id"]}/': throw new InvalidReverseParamsException(),
    'num_params':1},
    
    {
    'name':'admin:auth_user_password_change',
    'url':(Map? params)=>  '<id>/password/',
    'num_params':0},
    
    {
    'name':'admin:auth_user_changelist',
    'url':(Map? params)=>  '',
    'num_params':0},
    
    {
    'name':'admin:auth_user_add',
    'url':(Map? params)=>  'add/',
    'num_params':0},
    
    {
    'name':'admin:auth_user_history',
    'url':(Map? params)=> (params?["object_id"] != null) && true ? '${params?["object_id"]}/history/': throw new InvalidReverseParamsException(),
    'num_params':1},
    
    {
    'name':'admin:auth_user_delete',
    'url':(Map? params)=> (params?["object_id"] != null) && true ? '${params?["object_id"]}/delete/': throw new InvalidReverseParamsException(),
    'num_params':1},
    
    {
    'name':'admin:auth_user_change',
    'url':(Map? params)=> (params?["object_id"] != null) && true ? '${params?["object_id"]}/change/': throw new InvalidReverseParamsException(),
    'num_params':1},
    
    {
    'name':'admin',
    'url':(Map? params)=> (params?["object_id"] != null) && true ? '${params?["object_id"]}/': throw new InvalidReverseParamsException(),
    'num_params':1},
    
    {
    'name':'admin:authtoken_tokenproxy_changelist',
    'url':(Map? params)=>  '',
    'num_params':0},
    
    {
    'name':'admin:authtoken_tokenproxy_add',
    'url':(Map? params)=>  'add/',
    'num_params':0},
    
    {
    'name':'admin:authtoken_tokenproxy_history',
    'url':(Map? params)=> (params?["object_id"] != null) && true ? '${params?["object_id"]}/history/': throw new InvalidReverseParamsException(),
    'num_params':1},
    
    {
    'name':'admin:authtoken_tokenproxy_delete',
    'url':(Map? params)=> (params?["object_id"] != null) && true ? '${params?["object_id"]}/delete/': throw new InvalidReverseParamsException(),
    'num_params':1},
    
    {
    'name':'admin:authtoken_tokenproxy_change',
    'url':(Map? params)=> (params?["object_id"] != null) && true ? '${params?["object_id"]}/change/': throw new InvalidReverseParamsException(),
    'num_params':1},
    
    {
    'name':'admin',
    'url':(Map? params)=> (params?["object_id"] != null) && true ? '${params?["object_id"]}/': throw new InvalidReverseParamsException(),
    'num_params':1},
    
    {
    'name':'admin:core_person_changelist',
    'url':(Map? params)=>  '',
    'num_params':0},
    
    {
    'name':'admin:core_person_add',
    'url':(Map? params)=>  'add/',
    'num_params':0},
    
    {
    'name':'admin:core_person_history',
    'url':(Map? params)=> (params?["object_id"] != null) && true ? '${params?["object_id"]}/history/': throw new InvalidReverseParamsException(),
    'num_params':1},
    
    {
    'name':'admin:core_person_delete',
    'url':(Map? params)=> (params?["object_id"] != null) && true ? '${params?["object_id"]}/delete/': throw new InvalidReverseParamsException(),
    'num_params':1},
    
    {
    'name':'admin:core_person_change',
    'url':(Map? params)=> (params?["object_id"] != null) && true ? '${params?["object_id"]}/change/': throw new InvalidReverseParamsException(),
    'num_params':1},
    
    {
    'name':'admin',
    'url':(Map? params)=> (params?["object_id"] != null) && true ? '${params?["object_id"]}/': throw new InvalidReverseParamsException(),
    'num_params':1},
    
    {
    'name':'admin:workout_trainingplan_changelist',
    'url':(Map? params)=>  '',
    'num_params':0},
    
    {
    'name':'admin:workout_trainingplan_add',
    'url':(Map? params)=>  'add/',
    'num_params':0},
    
    {
    'name':'admin:workout_trainingplan_history',
    'url':(Map? params)=> (params?["object_id"] != null) && true ? '${params?["object_id"]}/history/': throw new InvalidReverseParamsException(),
    'num_params':1},
    
    {
    'name':'admin:workout_trainingplan_delete',
    'url':(Map? params)=> (params?["object_id"] != null) && true ? '${params?["object_id"]}/delete/': throw new InvalidReverseParamsException(),
    'num_params':1},
    
    {
    'name':'admin:workout_trainingplan_change',
    'url':(Map? params)=> (params?["object_id"] != null) && true ? '${params?["object_id"]}/change/': throw new InvalidReverseParamsException(),
    'num_params':1},
    
    {
    'name':'admin',
    'url':(Map? params)=> (params?["object_id"] != null) && true ? '${params?["object_id"]}/': throw new InvalidReverseParamsException(),
    'num_params':1},
    
    {
    'name':'admin:workout_training_changelist',
    'url':(Map? params)=>  '',
    'num_params':0},
    
    {
    'name':'admin:workout_training_add',
    'url':(Map? params)=>  'add/',
    'num_params':0},
    
    {
    'name':'admin:workout_training_history',
    'url':(Map? params)=> (params?["object_id"] != null) && true ? '${params?["object_id"]}/history/': throw new InvalidReverseParamsException(),
    'num_params':1},
    
    {
    'name':'admin:workout_training_delete',
    'url':(Map? params)=> (params?["object_id"] != null) && true ? '${params?["object_id"]}/delete/': throw new InvalidReverseParamsException(),
    'num_params':1},
    
    {
    'name':'admin:workout_training_change',
    'url':(Map? params)=> (params?["object_id"] != null) && true ? '${params?["object_id"]}/change/': throw new InvalidReverseParamsException(),
    'num_params':1},
    
    {
    'name':'admin',
    'url':(Map? params)=> (params?["object_id"] != null) && true ? '${params?["object_id"]}/': throw new InvalidReverseParamsException(),
    'num_params':1},
    
    {
    'name':'admin:workout_exercise_changelist',
    'url':(Map? params)=>  '',
    'num_params':0},
    
    {
    'name':'admin:workout_exercise_add',
    'url':(Map? params)=>  'add/',
    'num_params':0},
    
    {
    'name':'admin:workout_exercise_history',
    'url':(Map? params)=> (params?["object_id"] != null) && true ? '${params?["object_id"]}/history/': throw new InvalidReverseParamsException(),
    'num_params':1},
    
    {
    'name':'admin:workout_exercise_delete',
    'url':(Map? params)=> (params?["object_id"] != null) && true ? '${params?["object_id"]}/delete/': throw new InvalidReverseParamsException(),
    'num_params':1},
    
    {
    'name':'admin:workout_exercise_change',
    'url':(Map? params)=> (params?["object_id"] != null) && true ? '${params?["object_id"]}/change/': throw new InvalidReverseParamsException(),
    'num_params':1},
    
    {
    'name':'admin',
    'url':(Map? params)=> (params?["object_id"] != null) && true ? '${params?["object_id"]}/': throw new InvalidReverseParamsException(),
    'num_params':1},
    
    {
    'name':'admin:workout_typeoverload_changelist',
    'url':(Map? params)=>  '',
    'num_params':0},
    
    {
    'name':'admin:workout_typeoverload_add',
    'url':(Map? params)=>  'add/',
    'num_params':0},
    
    {
    'name':'admin:workout_typeoverload_history',
    'url':(Map? params)=> (params?["object_id"] != null) && true ? '${params?["object_id"]}/history/': throw new InvalidReverseParamsException(),
    'num_params':1},
    
    {
    'name':'admin:workout_typeoverload_delete',
    'url':(Map? params)=> (params?["object_id"] != null) && true ? '${params?["object_id"]}/delete/': throw new InvalidReverseParamsException(),
    'num_params':1},
    
    {
    'name':'admin:workout_typeoverload_change',
    'url':(Map? params)=> (params?["object_id"] != null) && true ? '${params?["object_id"]}/change/': throw new InvalidReverseParamsException(),
    'num_params':1},
    
    {
    'name':'admin',
    'url':(Map? params)=> (params?["object_id"] != null) && true ? '${params?["object_id"]}/': throw new InvalidReverseParamsException(),
    'num_params':1},
    
    {
    'name':'admin:app_list',
    'url':(Map? params)=>  '^(?P<app_label>sites|auth|authtoken|core|workout)/\$',
    'num_params':0},
    
    {
    'name':'admin',
    'url':(Map? params)=>  '(?P<url>.*)\$',
    'num_params':0},
    
    {
    'name':'schema-swagger-ui',
    'url':(Map? params)=>  '',
    'num_params':0},
    
    {
    'name':'schema-json',
    'url':(Map? params)=>  'swagger/<format>/',
    'num_params':0},
    
    {
    'name':'schema-swagger-ui',
    'url':(Map? params)=>  'swagger/',
    'num_params':0},
    
    {
    'name':'schema-redoc',
    'url':(Map? params)=>  'redoc/',
    'num_params':0},
    
    {
    'name':'workout:training_plan',
    'url':(Map? params)=>  'plan',
    'num_params':0},
    
    {
    'name':'workout:training_plan',
    'url':(Map? params)=> (params?["training_plan_id"] != null) && true ? 'plan/${params?["training_plan_id"]}': throw new InvalidReverseParamsException(),
    'num_params':1},
    
    {
    'name':'workout:training',
    'url':(Map? params)=> (params?["training_plan_id"] != null) && true ? 'training/${params?["training_plan_id"]}': throw new InvalidReverseParamsException(),
    'num_params':1},
    
    {
    'name':'workout:training',
    'url':(Map? params)=> (params?["training_plan_id"] != null) &&(params?["training_id"] != null) && true ? 'training/${params?["training_plan_id"]}/${params?["training_id"]}': throw new InvalidReverseParamsException(),
    'num_params':2},
    
    {
    'name':'workout:exercise',
    'url':(Map? params)=> (params?["training_id"] != null) && true ? 'exercise/${params?["training_id"]}': throw new InvalidReverseParamsException(),
    'num_params':1},
    
    {
    'name':'workout:exercise',
    'url':(Map? params)=> (params?["training_id"] != null) &&(params?["exercise_id"] != null) && true ? 'exercise/${params?["training_id"]}/${params?["exercise_id"]}': throw new InvalidReverseParamsException(),
    'num_params':2},
    
    {
    'name':'workout:exercise_overload',
    'url':(Map? params)=> (params?["exercise_id"] != null) && true ? 'exercise/${params?["exercise_id"]}/overload': throw new InvalidReverseParamsException(),
    'num_params':1},
    
    {
    'name':'workout:exercise_overload',
    'url':(Map? params)=> (params?["exercise_id"] != null) &&(params?["index"] != null) && true ? 'exercise/${params?["exercise_id"]}/${params?["index"]}/overload': throw new InvalidReverseParamsException(),
    'num_params':2},
    
    {
    'name':'workout:exercise_order',
    'url':(Map? params)=> (params?["training_id"] != null) &&(params?["exercise_id"] != null) && true ? 'exercise/${params?["training_id"]}/${params?["exercise_id"]}/order': throw new InvalidReverseParamsException(),
    'num_params':2},
    
    {
    'name':'my_auth:login',
    'url':(Map? params)=>  'login',
    'num_params':0},
    
    {
    'name':'my_auth:register',
    'url':(Map? params)=>  'register',
    'num_params':0},
    
    {
    'name':'my_auth:logout',
    'url':(Map? params)=>  'logout',
    'num_params':0},
     ];
    for (var value in data) {
    if (value['name'] == name && value['num_params'] == (params?.length ?? 0)) {
    
    try {
    
      return value['url'](params);
    
    }
    on InvalidReverseParamsException {
        
        print('Warning: Reverse parameters were named incorrectly.');
        print(params);
        
    }
    
    }
  }
  return null;
}




