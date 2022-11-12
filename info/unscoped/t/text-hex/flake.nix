{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/text-hex?_rev=10-04701a1aece3fe3bdbc728f9015dc2b3";
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
    ident = "text-hex";
    ldir  = "info/unscoped/t/text-hex";
    inherit packument fetchInfo;
  } // latest';

}
