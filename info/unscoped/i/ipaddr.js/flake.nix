{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/ipaddr.js?_rev=68-4929e57dfc91a756b6d3a03a320d51af";
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
    ident = "ipaddr.js";
    ldir  = "info/unscoped/i/ipaddr.js";
    inherit packument fetchInfo;
  } // latest';

}
