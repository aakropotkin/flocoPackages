{

  inputs.packument.url   = "https://registry.npmjs.org/pug-linker?rev=43-6d73d1023615b6ec9043bfb5b53b3340";
  inputs.packument.flake = false;

  outputs = inputs: let
    importJSON = f: builtins.fromJSON ( builtins.readFile f );
    packument  = importJSON inputs.packument;
    fetchInfo  = if ! builtins.pathExists ./fetchInfo.json then {} else
                 importJSON ./fetchInfo.json;
    latest'    = if ! ( packument ? dist-tags.latest ) then {} else {
      latestVersion = packument.dist-tags.latest;
      latest        = packument.versions.${packument.dist-tags.latest};
    };
  in {
    scope = null;
    ident = "pug-linker";
    ldir  = "info/unscoped/p/pug-linker";
    inherit packument fetchInfo;
  } // latest';

}
