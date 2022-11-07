{

  inputs.packument.url   = "https://registry.npmjs.org/supertest?rev=419-a1c9f8e0f779b043caebae907b87802e";
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
    ident = "supertest";
    ldir  = "info/unscoped/s/supertest";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
