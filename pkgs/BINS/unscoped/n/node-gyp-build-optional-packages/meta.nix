{ version }: {
  bin =
  if version == "4.3.0" then
    {
      node-gyp-build          = "bin.js";
      node-gyp-build-optional = "optional.js";
      node-gyp-build-test     = "build-test.js";
    }
  else if builtins.elem version ["4.3.1" "4.3.2" "5.0.0" "5.0.1" "5.0.2"] then
    {
      node-gyp-build-optional-packages = "bin.js";
      node-gyp-build-optional          = "optional.js";
      node-gyp-build-test              = "build-test.js";
    }
  else #if builtins.elem version ["4.3.3" "4.3.4" "4.3.5" "5.0.3"] then
    {
      node-gyp-build-optional-packages          = "bin.js";
      node-gyp-build-optional-packages-optional = "optional.js";
      node-gyp-build-optional-packages-test     = "build-test.js";
    };
}
