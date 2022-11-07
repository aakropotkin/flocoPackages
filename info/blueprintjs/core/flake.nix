{

  inputs.packument.url   = "https://registry.npmjs.org/@blueprintjs/core?rev=237-ef955d03d245de37ecb180ad4b493d4e";
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
    scope = "@blueprintjs";
    ident = "@blueprintjs/core";
    ldir  = "info/blueprintjs/core";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
