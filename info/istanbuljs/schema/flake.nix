{

  inputs.packument.url   = "https://registry.npmjs.org/@istanbuljs/schema?rev=5-81416b2f2cb9d595865b1ee23f7c893d";
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
    scope = "@istanbuljs";
    ident = "@istanbuljs/schema";
    ldir  = "info/istanbuljs/schema";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
