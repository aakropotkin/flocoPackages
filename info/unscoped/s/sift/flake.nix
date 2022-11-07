{

  inputs.packument.url   = "https://registry.npmjs.org/sift?rev=273-89186f7f0e02b1e2fcc98734a3110d9e";
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
    ident = "sift";
    ldir  = "info/unscoped/s/sift";
    inherit packument fetchInfo;
  } // latest';

}
