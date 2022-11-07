{

  inputs.packument.url   = "https://registry.npmjs.org/image-q?rev=33-c02f4c4b1a974638cda2d8d57701ae4e";
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
    ident = "image-q";
    ldir  = "info/unscoped/i/image-q";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
