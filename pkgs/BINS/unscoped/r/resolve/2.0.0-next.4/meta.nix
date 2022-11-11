# THIS FILE WAS GENERATED. Manual edits may be lost.
# Deserialze with:  lib.libmeta.metaSetFromSerial
# Regen with: nix run --impure at-node-nix#genMeta -- --prod resolve@2.0.0-next.4
{
  __meta = {
    fromType = "package-lock.json(v3)";
    rootKey = "resolve/2.0.0-next.4";
    trees = {
      prod = {
        "node_modules/function-bind" = "function-bind/1.1.1";
        "node_modules/has" = "has/1.0.3";
        "node_modules/is-core-module" = "is-core-module/2.11.0";
        "node_modules/path-parse" = "path-parse/1.0.7";
        "node_modules/supports-preserve-symlinks-flag" = "supports-preserve-symlinks-flag/1.0.0";
      };
    };
  };
  "function-bind/1.1.1" = {
    depInfo = { };
    entFromtype = "package-lock.json(v3)";
    ident = "function-bind";
    key = "function-bind/1.1.1";
    scoped = false;
    fetchInfo = {
      entSubtype = "registry-tarball";
      hash = "sha512-yIovAzMX49sF8Yl58fSCWJ5svSLuaibPxXQJFLmBObTuCr0Mf1KiPopGM9NiFjiYBCbfaa2Fh6breQ6ANVTI0A==";
      sha512 = "yIovAzMX49sF8Yl58fSCWJ5svSLuaibPxXQJFLmBObTuCr0Mf1KiPopGM9NiFjiYBCbfaa2Fh6breQ6ANVTI0A==";
      type = "tarball";
      url = "https://registry.npmjs.org/function-bind/-/function-bind-1.1.1.tgz";
    };
    version = "1.1.1";
  };
  "has/1.0.3" = {
    depInfo = {
      function-bind = {
        descriptor = "^1.1.1";
        runtime = true;
      };
    };
    entFromtype = "package-lock.json(v3)";
    ident = "has";
    key = "has/1.0.3";
    scoped = false;
    fetchInfo = {
      entSubtype = "registry-tarball";
      hash = "sha512-f2dvO0VU6Oej7RkWJGrehjbzMAjFp5/VKPp5tTpWIV4JHHZK1/BxbFRtf/siA2SWTe09caDmVtYYzWEIbBS4zw==";
      sha512 = "f2dvO0VU6Oej7RkWJGrehjbzMAjFp5/VKPp5tTpWIV4JHHZK1/BxbFRtf/siA2SWTe09caDmVtYYzWEIbBS4zw==";
      type = "tarball";
      url = "https://registry.npmjs.org/has/-/has-1.0.3.tgz";
    };
    version = "1.0.3";
  };
  "is-core-module/2.11.0" = {
    depInfo = {
      has = {
        descriptor = "^1.0.3";
        runtime = true;
      };
    };
    entFromtype = "package-lock.json(v3)";
    ident = "is-core-module";
    key = "is-core-module/2.11.0";
    scoped = false;
    fetchInfo = {
      entSubtype = "registry-tarball";
      hash = "sha512-RRjxlvLDkD1YJwDbroBHMb+cukurkDWNyHx7D3oNB5x9rb5ogcksMC5wHCadcXoo67gVr/+3GFySh3134zi6rw==";
      sha512 = "RRjxlvLDkD1YJwDbroBHMb+cukurkDWNyHx7D3oNB5x9rb5ogcksMC5wHCadcXoo67gVr/+3GFySh3134zi6rw==";
      type = "tarball";
      url = "https://registry.npmjs.org/is-core-module/-/is-core-module-2.11.0.tgz";
    };
    version = "2.11.0";
  };
  "path-parse/1.0.7" = {
    depInfo = { };
    entFromtype = "package-lock.json(v3)";
    ident = "path-parse";
    key = "path-parse/1.0.7";
    scoped = false;
    fetchInfo = {
      entSubtype = "registry-tarball";
      hash = "sha512-LDJzPVEEEPR+y48z93A0Ed0yXb8pAByGWo/k5YYdYgpY2/2EsOsksJrq7lOHxryrVOn1ejG6oAp8ahvOIQD8sw==";
      sha512 = "LDJzPVEEEPR+y48z93A0Ed0yXb8pAByGWo/k5YYdYgpY2/2EsOsksJrq7lOHxryrVOn1ejG6oAp8ahvOIQD8sw==";
      type = "tarball";
      url = "https://registry.npmjs.org/path-parse/-/path-parse-1.0.7.tgz";
    };
    version = "1.0.7";
  };
  "resolve/2.0.0-next.4" = {
    bin = {
      resolve = "bin/resolve";
    };
    depInfo = {
      is-core-module = {
        descriptor = "^2.9.0";
        runtime = true;
      };
      path-parse = {
        descriptor = "^1.0.7";
        runtime = true;
      };
      supports-preserve-symlinks-flag = {
        descriptor = "^1.0.0";
        runtime = true;
      };
    };
    entFromtype = "package-lock.json(v3)";
    hasBin = true;
    ident = "resolve";
    key = "resolve/2.0.0-next.4";
    scoped = false;
    fetchInfo = {
      entSubtype = "registry-tarball";
      hash = "sha512-iMDbmAWtfU+MHpxt/I5iWI7cY6YVEZUQ3MBgPQ++XD1PELuJHIl82xBmObyP2KyQmkNB2dsqF7seoQQiAn5yDQ==";
      sha512 = "iMDbmAWtfU+MHpxt/I5iWI7cY6YVEZUQ3MBgPQ++XD1PELuJHIl82xBmObyP2KyQmkNB2dsqF7seoQQiAn5yDQ==";
      type = "tarball";
      url = "https://registry.npmjs.org/resolve/-/resolve-2.0.0-next.4.tgz";
    };
    version = "2.0.0-next.4";
  };
  "supports-preserve-symlinks-flag/1.0.0" = {
    depInfo = { };
    entFromtype = "package-lock.json(v3)";
    ident = "supports-preserve-symlinks-flag";
    key = "supports-preserve-symlinks-flag/1.0.0";
    scoped = false;
    fetchInfo = {
      entSubtype = "registry-tarball";
      hash = "sha512-ot0WnXS9fgdkgIcePe6RHNk1WA8+muPa6cSjeR3V8K27q9BB1rTE3R1p7Hv0z1ZyAc8s6Vvv8DIyWf681MAt0w==";
      sha512 = "ot0WnXS9fgdkgIcePe6RHNk1WA8+muPa6cSjeR3V8K27q9BB1rTE3R1p7Hv0z1ZyAc8s6Vvv8DIyWf681MAt0w==";
      type = "tarball";
      url = "https://registry.npmjs.org/supports-preserve-symlinks-flag/-/supports-preserve-symlinks-flag-1.0.0.tgz";
    };
    version = "1.0.0";
  };
}
