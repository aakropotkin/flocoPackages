{

  inputs.packument.url   = "https://registry.npmjs.org/string.prototype.matchall?rev=16-812471c8a3880d6e4522e1958a440e9a";
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
    ident = "string.prototype.matchall";
    ldir  = "info/unscoped/s/string.prototype.matchall";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
