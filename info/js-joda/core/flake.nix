{

  inputs.packument.url   = "https://registry.npmjs.org/@js-joda/core?rev=21-fb8d985ec07488f7bf4c962b88064452";
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
    scope = "@js-joda";
    ident = "@js-joda/core";
    ldir  = "info/js-joda/core";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
