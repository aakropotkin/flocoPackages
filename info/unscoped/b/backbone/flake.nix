{

  inputs.packument.url   = "https://registry.npmjs.org/backbone?rev=221-209975780f5151b51db5ab472ea080d2";
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
    ident = "backbone";
    ldir  = "info/unscoped/b/backbone";
    inherit packument fetchInfo;
  } // latest';

}
