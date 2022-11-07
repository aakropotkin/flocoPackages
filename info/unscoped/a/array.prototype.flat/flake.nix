{

  inputs.packument.url   = "https://registry.npmjs.org/array.prototype.flat?rev=10-3d5f4b17ce0de61d783f2a6c0ea25ac5";
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
    ident = "array.prototype.flat";
    ldir  = "info/unscoped/a/array.prototype.flat";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
