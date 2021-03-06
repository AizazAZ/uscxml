#define XERCES_HAS_CPP_NAMESPACE 1

%include <std_string.i>

%module LuaDOM

%import "uscxml/config.h"
%import "uscxml/Common.h"

%import "xercesc/util/XercesDefs.hpp"
%import "xercesc/util/Xerces_autoconf_config.hpp"

%include "../common/bindings/dom/ignore.i"
%include "../common/bindings/dom/defines.i"
%include "../common/bindings/dom/typemaps-general.i"

// in typemap
%typemap(in) XMLCh * %{
  $1 = Lua2XMLString($input);
%}

%typemap(freearg) XMLCh * %{
  delete[] $1;
%}

// out typemap
%typemap(out) XMLCh * %{
  $result = XMLString2Lua($1);
%}

%include "../common/bindings/dom/dom.i"

// Operators we do want
// %rename(operator_assignment) operator=;
%rename(operator_equal_to) operator==;
%rename(operator_not_equal_to) operator!=;

%include "../common/bindings/event.i"
