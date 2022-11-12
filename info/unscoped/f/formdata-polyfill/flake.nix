{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/formdata-polyfill?_rev=51-971e2ae361d46445d7b7f796edfb2adf";
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
    ident = "formdata-polyfill";
    ldir  = "info/unscoped/f/formdata-polyfill";
    inherit packument fetchInfo;
  } // latest';

}
