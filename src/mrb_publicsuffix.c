/*
** mrb_publicsuffix.c - PublicSuffix class
**
** Copyright (c) Okumura Takahiro 2018
**
** See Copyright Notice in LICENSE
*/

#include "mruby.h"
#include "mruby/data.h"
#include "mrb_publicsuffix.h"

#define DONE mrb_gc_arena_restore(mrb, 0);

typedef struct {
  char *str;
  int len;
} mrb_publicsuffix_data;

static const struct mrb_data_type mrb_publicsuffix_data_type = {
  "mrb_publicsuffix_data", mrb_free,
};

static mrb_value mrb_publicsuffix_init(mrb_state *mrb, mrb_value self)
{
  mrb_publicsuffix_data *data;
  char *str;
  int len;

  data = (mrb_publicsuffix_data *)DATA_PTR(self);
  if (data) {
    mrb_free(mrb, data);
  }
  DATA_TYPE(self) = &mrb_publicsuffix_data_type;
  DATA_PTR(self) = NULL;

  mrb_get_args(mrb, "s", &str, &len);
  data = (mrb_publicsuffix_data *)mrb_malloc(mrb, sizeof(mrb_publicsuffix_data));
  data->str = str;
  data->len = len;
  DATA_PTR(self) = data;

  return self;
}

static mrb_value mrb_publicsuffix_hello(mrb_state *mrb, mrb_value self)
{
  mrb_publicsuffix_data *data = DATA_PTR(self);

  return mrb_str_new(mrb, data->str, data->len);
}

static mrb_value mrb_publicsuffix_hi(mrb_state *mrb, mrb_value self)
{
  return mrb_str_new_cstr(mrb, "hi!!");
}

void mrb_mruby_publicsuffix_gem_init(mrb_state *mrb)
{
  struct RClass *publicsuffix;
  publicsuffix = mrb_define_class(mrb, "PublicSuffix", mrb->object_class);
  mrb_define_method(mrb, publicsuffix, "initialize", mrb_publicsuffix_init, MRB_ARGS_REQ(1));
  mrb_define_method(mrb, publicsuffix, "hello", mrb_publicsuffix_hello, MRB_ARGS_NONE());
  mrb_define_class_method(mrb, publicsuffix, "hi", mrb_publicsuffix_hi, MRB_ARGS_NONE());
  DONE;
}

void mrb_mruby_publicsuffix_gem_final(mrb_state *mrb)
{
}

