{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/any-promise?_rev=27-ff4600162a7dddb4298528aa91fa559f";
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
    ident = "any-promise";
    ldir  = "info/unscoped/a/any-promise";
    inherit packument fetchInfo;
  } // latest';

}
