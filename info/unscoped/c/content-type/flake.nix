{

  inputs.packument.url   = "https://registry.npmjs.org/content-type?rev=30-48cf7b0d7a91ba140c5e323523fa2e4c";
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
    ident = "content-type";
    ldir  = "info/unscoped/c/content-type";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
