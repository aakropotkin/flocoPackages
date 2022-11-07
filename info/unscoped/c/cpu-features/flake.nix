{

  inputs.packument.url   = "https://registry.npmjs.org/cpu-features?rev=4-bd65eea705b9b0cfa253e3922239cbaf";
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
    ident = "cpu-features";
    ldir  = "info/unscoped/c/cpu-features";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
