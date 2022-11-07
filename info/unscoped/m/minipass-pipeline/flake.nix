{

  inputs.packument.url   = "https://registry.npmjs.org/minipass-pipeline?rev=11-a038a911dbd99b10b9bb3a67679eeb09";
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
    ident = "minipass-pipeline";
    ldir  = "info/unscoped/m/minipass-pipeline";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
