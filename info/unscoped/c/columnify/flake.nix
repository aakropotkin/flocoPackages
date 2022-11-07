{

  inputs.packument.url   = "https://registry.npmjs.org/columnify?rev=72-c8441cf8e17952a203e8e14e9183a13d";
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
    ident = "columnify";
    ldir  = "info/unscoped/c/columnify";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
