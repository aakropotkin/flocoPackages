{

  inputs.packument.url   = "https://registry.npmjs.org/array.prototype.find?rev=24-67114d6cbd86168cbc68210b6d1fde66";
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
    ident = "array.prototype.find";
    ldir  = "info/unscoped/a/array.prototype.find";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
