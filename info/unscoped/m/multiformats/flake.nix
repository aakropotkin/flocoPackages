{

  inputs.packument.url   = "https://registry.npmjs.org/multiformats?rev=134-634faaf29baa79c64045ab44595302e6";
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
    ident = "multiformats";
    ldir  = "info/unscoped/m/multiformats";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
