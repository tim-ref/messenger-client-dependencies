}

var prom;

return {init() {
  if (!prom) prom = single_init.call(this);
  return prom;
}};

})();
