schema_header::{}

type::{
  name: json,
  type: $any,
  one_of: [
    json_array,
    json_boolean,
    json_null,
    json_number,
    json_object,
    json_string,
  ],
}

type::{
  name: json_array,
  type: list,
  annotations: closed::[],
  element: json,
}

type::{
  name: json_boolean,
  type: bool,
  annotations: closed::[],
}

type::{
  name: json_null,
  type: $null,
  annotations: closed::[],
}

type::{
  name: json_number,
  one_of: [float, int],
  not: { valid_values: [nan, +inf, -inf] },
  annotations: closed::[],
}

type::{
  name: json_object,
  type: struct,
  annotations: closed::[],
  element: json,
}

type::{
  name: json_string,
  type: string,
  annotations: closed::[],
}

schema_footer::{}

valid::{
  json: [
    null,
    null.null,
    true,
    false,
    "Hello World",
    1,
    1.5e1,
    [],
    ["a", 1, true, null],
    {},
    {"foo": 1, bar: true},
    {"foo": 1, 'foo': true, foo: null}, // JSON does technically allow duplicate field names
  ],
}

invalid::{
  json: [
    null.int,
    null.float,
    null.decimal,
    null.symbol,
    null.string,
    null.timestamp,
    null.blob,
    null.clob,
    null.bool,
    null.list,
    null.sexp,
    null.struct,
    foo::true,
    bar::false,
    ''::1,
    (),
    (1 2 3),
    foo::[1, 2, 3],
    bar::{a:1, b:2},
    {a:1, b:()},
    [+inf],
    [-inf],
    {foo: nan},
    2021-06-15T,
    2021-06-15T12:00:00.000Z,
    nan,
    +inf,
    -inf,
    {{ "abcd" }},
    {{ SGVsbG8gV29ybGQ= }},
    annotated::"string",
    a_symbol,
    1d5,
    1.23,
    1.2d3
  ],
}
