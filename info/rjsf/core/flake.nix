{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@rjsf%2fcore?_rev=44-c2bbec2e8668f0ae680aa1c51f2337c6";
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
    scope = "@rjsf";
    ident = "@rjsf/core";
    ldir  = "info/rjsf/core";
    inherit packument fetchInfo;
  } // latest';

}
