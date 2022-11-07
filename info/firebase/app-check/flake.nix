{

  inputs.packument.url   = "https://registry.npmjs.org/@firebase/app-check?rev=716-8a24044b954595d9cda0cc1fa7082c48";
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
    scope = "@firebase";
    ident = "@firebase/app-check";
    ldir  = "info/firebase/app-check";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
