{

  inputs.packument.url   = "https://registry.npmjs.org/array.prototype.every?rev=11-9a789fa5c71ffd67af56af884cd247fa";
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
    ident = "array.prototype.every";
    ldir  = "info/unscoped/a/array.prototype.every";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
