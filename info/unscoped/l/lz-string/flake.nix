{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/lz-string?_rev=43-83eb2fe4a72c871811f13dc52240e5f4";
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
    ident = "lz-string";
    ldir  = "info/unscoped/l/lz-string";
    inherit packument fetchInfo;
  } // latest';

}
