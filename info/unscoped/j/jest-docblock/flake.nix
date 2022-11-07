{

  inputs.packument.url   = "https://registry.npmjs.org/jest-docblock?rev=133-0cfd51ca3ab098607f0914158d4298a8";
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
    ident = "jest-docblock";
    ldir  = "info/unscoped/j/jest-docblock";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
