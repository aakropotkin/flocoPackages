{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@rushstack%2feslint-patch?_rev=101-0da0082005cb9ae5b140345e905c8835";
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
    scope = "@rushstack";
    ident = "@rushstack/eslint-patch";
    ldir  = "info/rushstack/eslint-patch";
    inherit packument fetchInfo;
  } // latest';

}
