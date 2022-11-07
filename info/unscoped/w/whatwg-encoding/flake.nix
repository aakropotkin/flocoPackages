{

  inputs.packument.url   = "https://registry.npmjs.org/whatwg-encoding?rev=11-2be376c3741b34f8effa02bbd66d84e1";
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
    ident = "whatwg-encoding";
    ldir  = "info/unscoped/w/whatwg-encoding";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
