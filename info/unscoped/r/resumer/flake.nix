{

  inputs.packument.url   = "https://registry.npmjs.org/resumer?rev=8-24bfb11a64c39eb8d682994133f2d597";
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
    ident = "resumer";
    ldir  = "info/unscoped/r/resumer";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
