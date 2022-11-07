{

  inputs.packument.url   = "https://registry.npmjs.org/cli-spinners?rev=49-fc800e09b32d7309dfd7a91ac98d5675";
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
    ident = "cli-spinners";
    ldir  = "info/unscoped/c/cli-spinners";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
