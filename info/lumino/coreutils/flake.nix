{

  inputs.packument.url   = "https://registry.npmjs.org/@lumino/coreutils?rev=39-e2ede02f57348232463e7f05637dce85";
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
    scope = "@lumino";
    ident = "@lumino/coreutils";
    ldir  = "info/lumino/coreutils";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
