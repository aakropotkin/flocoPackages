{

  inputs.packument.url   = "https://registry.npmjs.org/humanize-number?rev=9-fe3d255ad683d022ec0edf8e2d93a7cc";
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
    ident = "humanize-number";
    ldir  = "info/unscoped/h/humanize-number";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
