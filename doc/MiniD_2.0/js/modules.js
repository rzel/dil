var g_modulesList = [
  "minid.alloc", "minid.api", "minid.array", "minid.arraylib", "minid.ast",
  "minid.astvisitor", "minid.baselib", "minid.bind", "minid.charlib",
  "minid.classobj", "minid.codegen", "minid.commandline", "minid.compiler",
  "minid.compilertypes", "minid.ex", "minid.func", "minid.funcdef", "minid.gc",
  "minid.hash", "minid.hashlib", "minid.instance", "minid.interpreter",
  "minid.iolib", "minid.lexer", "minid.mathlib", "minid.misc",
  "minid.moduleslib", "minid.namespace", "minid.nativeobj", "minid.opcodes",
  "minid.oslib", "minid.parser", "minid.regexplib", "minid.semantic",
  "minid.serialization", "minid.streamlib", "minid.stringbuffer",
  "minid.string", "minid.stringlib", "minid.table", "minid.thread",
  "minid.threadlib", "minid.timelib", "minid.types", "minid.utils",
  "minid.vector", "minid.vm", "minid.weakref",
];

function M(name, fqn, sub)
{
  sub = sub ? sub : [];
  return {
    name: name, fqn: fqn, sub: sub,
    kind : (sub && sub.length == 0) ? "module" : "package"
  };
}
var P = M;

var g_moduleObjects = [
  P('minid','minid',[
    M('alloc','minid.alloc'),
    M('api','minid.api'),
    M('array','minid.array'),
    M('arraylib','minid.arraylib'),
    M('ast','minid.ast'),
    M('astvisitor','minid.astvisitor'),
    M('baselib','minid.baselib'),
    M('bind','minid.bind'),
    M('charlib','minid.charlib'),
    M('classobj','minid.classobj'),
    M('codegen','minid.codegen'),
    M('commandline','minid.commandline'),
    M('compiler','minid.compiler'),
    M('compilertypes','minid.compilertypes'),
    M('ex','minid.ex'),
    M('func','minid.func'),
    M('funcdef','minid.funcdef'),
    M('gc','minid.gc'),
    M('hash','minid.hash'),
    M('hashlib','minid.hashlib'),
    M('instance','minid.instance'),
    M('interpreter','minid.interpreter'),
    M('iolib','minid.iolib'),
    M('lexer','minid.lexer'),
    M('mathlib','minid.mathlib'),
    M('misc','minid.misc'),
    M('moduleslib','minid.moduleslib'),
    M('namespace','minid.namespace'),
    M('nativeobj','minid.nativeobj'),
    M('opcodes','minid.opcodes'),
    M('oslib','minid.oslib'),
    M('parser','minid.parser'),
    M('regexplib','minid.regexplib'),
    M('semantic','minid.semantic'),
    M('serialization','minid.serialization'),
    M('streamlib','minid.streamlib'),
    M('string','minid.string'),
    M('stringbuffer','minid.stringbuffer'),
    M('stringlib','minid.stringlib'),
    M('table','minid.table'),
    M('thread','minid.thread'),
    M('threadlib','minid.threadlib'),
    M('timelib','minid.timelib'),
    M('types','minid.types'),
    M('utils','minid.utils'),
    M('vector','minid.vector'),
    M('vm','minid.vm'),
    M('weakref','minid.weakref'),
  ]),
];